<template>
    <div className="overlay">
        <div className="modal">
            <TextField :length="32" :disabled="readonly" v-model="value.surname" :label="'Фамилия:'"
                :placeholder="'Введите фамилию...'" />
            <TextField :length="32" :disabled="readonly" v-model="value.name" :label="'Имя:'"
                :placeholder="'Введите имя...'" />
            <TextField :length="32" :disabled="readonly" v-model="value.patronymic" :label="'Отчество:'"
                :placeholder="'Введите отчество...'" />
            <TextField :length="16" :disabled="readonly" v-model="value.date_birth"
                :placeholder="'Введите дату рождения...'" :label="'Дата рождения:'" />
            <SelectField :length="16" :disabled="readonly"
                :options="['Православное', 'Римско-католическое', 'Евангельско-лютеранское', 'Иное']"
                v-model="value.religion" :label="'Вероисповедение:'" />
            <TextField :length="16" :disabled="readonly" v-model="value.origin"
                :placeholder="'Введите происхождение...'" :label="'Происхождение:'" />
            <SelectField :length="16" :disabled="readonly"
                :options="['Нет образования', 'Начальное образование', 'Домашнее образование', 'Среднее образование', 'Среднее военное образование', 'Высшее образование', 'Высшее военное образование']"
                v-model="value.level_education" :label="'Уровень образования:'" />
            <TextField :length="64" :disabled="readonly" v-model="value.educational_institution"
                :label="'Учебное учреждение:'" :placeholder="'Введите учебное учреждение...'" />
            <SelectField :length="16" :disabled="readonly" :options="['Неизвестно', 'Европейская часть', 'Сибирь']"
                v-model="value.location_educational_institution" :label="'Место учёбы:'" />
            <TextAreaField :length="4096" :disabled="readonly" v-model="value.property" :label="'Имущество:'"
                :placeholder="'Введите имущество...'" />
            <TextAreaField :length="4096" :disabled="readonly" v-model="value.awards" :label="'Награды:'"
                :placeholder="'Введите награды...'" />
            <TextAreaField :length="4096" :disabled="readonly" v-model="value.salary" :label="'Жалование:'"
                :placeholder="'Введите жалование...'" />
            <TextAreaField :length="4096" :disabled="readonly" v-model="value.marital_status"
                :label="'Семейное положение:'" :placeholder="'Введите семейное положение...'" />
            <TextAreaField :length="4096" :disabled="readonly" v-model="value.other"
                :label="'Отпуска, отставки, штрафы, суды, военные походы:'" :placeholder="'Введите описание...'" />
            <ActivityField :person="this.$props.person"></ActivityField>
            <RankField :person="this.$props.person"></RankField>
            <CareerField :person="this.$props.person"></CareerField>
            <button @click="save">Сохранить</button>
            <button @click="remove(), onClose()">Удалить</button>
            <button @click="onClose">Закрыть</button>
        </div>
    </div>
</template>
  
<script>
import axios from 'axios';
import TextAreaField from './fields/TextAreaField.vue';
import SelectField from './fields/SelectField.vue';
import TextField from './fields/TextField.vue';
import DateField from './fields/DateField.vue';
import ActivityField from './fields/ActivityField.vue';
import RankField from './fields/RankField.vue';
import CareerField from './fields/CareerField.vue';

const SERVER_PORT = '5050';
const SERVER_HOST = '194.87.232.70';

export default {
    created() {
        this.get();
    },
    components: {
        ActivityField,
        TextAreaField,
        SelectField,
        TextField,
        DateField,
        TextAreaField,
        RankField,
        CareerField
    },
    data() {
        return {
            value: {}
        };
    },
    props: {
        readonly: {
            type: Boolean,
            required: false,
            default: true
        },
        onClose: {
            type: Function,
            required: true
        },
        person: {
            required: true
        }
    },
    methods: {
        get() {
            axios.get(`http://${SERVER_HOST}:${SERVER_PORT}/api/person`, { params: { id: this.$props.person.id } }).then((response) => this.value = response.data[0]);
        },
        save() {
            axios.put(`http://${SERVER_HOST}:${SERVER_PORT}/api/person/${this.$props.person.id}`, this.value).then(() => console.log("update"));
        },
        remove() {
            axios.delete(`http://${SERVER_HOST}:${SERVER_PORT}/api/person/${this.$props.person.id}`).then(() => console.log("delete"));
        }
    }
}
</script>
  
<style>
input {
    width: 400px;
}

.modal {
    width: 70vw;
    overflow: auto;
    max-height: 90vh;
    background: rgb(255, 255, 255);
    position: absolute;
    float: left;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
}

.overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
    background-color: rgba(128, 128, 128, 0.5);
}
</style>
  