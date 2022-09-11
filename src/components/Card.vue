<template>
    <div className="modal">
        <TextField :disabled="true" v-model="value.surname" :label="'Фамилия:'" :placeholder="'Введите фамилию...'"></TextField>
        <TextField :disabled="true" v-model="value.name" :label="'Имя:'" :placeholder="'Введите имя...'"></TextField>
        <TextField :disabled="true" v-model="value.patronymic" :label="'Отчество:'" :placeholder="'Введите отчество...'"></TextField>
        <DateField :disabled="true" v-model="value.date_birth" :label="'Дата рождения:'"></DateField>
        <SelectField :disabled="true" :options="['Православное', 'Римско-католическое', 'Евангельско-лютеранское', 'Иное']"
            v-model="value.religion" :label="'Вероисповедение:'"></SelectField>
        <SelectField :disabled="true" :options="['1', '2', '3', 'Иное']" v-model="value.origin" :label="'Происхождение:'"></SelectField>
        <SelectField :disabled="true"
            :options="['Нет образования', 'Начальное образование', 'Домашнее образование', 'Среднее образование', 'Среднее военное образование', 'Высшее образование', 'Высшее военное образование']"
            v-model="value.level_education" :label="'Уровень образования:'"></SelectField>
        <TextField :disabled="true" v-model="value.educational_institution" :label="'Учебное учреждение:'"
            :placeholder="'Введите учебное учреждение...'"></TextField>
        <SelectField :disabled="true" :options="['Неизвестно', 'Европейская часть', 'Сибирь']"
            v-model="value.location_educational_institution" :label="'Место учёбы:'"></SelectField>
        <TextAreaField :disabled="true" v-model="value.property" :label="'Имущество:'" :placeholder="'Введите имущество...'">
        </TextAreaField>
        <TextAreaField :disabled="true" v-model="value.awards" :label="'Награды:'" :placeholder="'Введите награды...'"></TextAreaField>
        <TextAreaField :disabled="true" v-model="value.salary" :label="'Жалование:'" :placeholder="'Введите жалование...'">
        </TextAreaField>
        <TextAreaField :disabled="true" v-model="value.marital_status" :label="'Семейное положение:'"
            :placeholder="'Введите семейное положение...'"></TextAreaField>
        <TextAreaField :disabled="true" v-model="value.other" :label="'Отпуска, отставки, штрафы, суды, военные походы:'"
            :placeholder="'Введите описание...'"></TextAreaField>
        <button @click="save">Сохранить</button>
        <button @click="onClose">Закрыть</button>
    </div>
</template>
  
<script>
import axios from 'axios';
import TextAreaField from './fields/TextAreaField.vue';
import SelectField from './fields/SelectField.vue';
import TextField from './fields/TextField.vue';
import DateField from './fields/DateField.vue';

const SERVER_PORT = '5050';
const SERVER_HOST = '194.87.232.70';

export default {
    components: {
        TextAreaField,
        SelectField,
        TextField,
        DateField,
        TextAreaField
    },
    data() {
        return {
            value: this.$props.person
        };
    },
    props: {
        onClose: {
            type: Function,
            required: true
        },
        person: {
            required: true
        }
    },
    methods: {
        save() {
            axios.put('http://' + SERVER_HOST + ':' + SERVER_PORT + '/api/person/' + this.value.id, this.value).then(() => console.log("OK"));
        }
    }
}
</script>
  
<style>
.modal {
    background: green;
    position: absolute;
    float: left;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
}
</style>
  