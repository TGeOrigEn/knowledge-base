<template>
    <div :class="'field'">
        <div>
            <DateField :label="'Дата начала:'" v-model="startDate"></DateField>
            <DateField :label="'Дата Окончания:'" v-model="endDate"></DateField>
            <SelectField :label="'Класс:'"
                :options="['I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X', 'XI', 'XII', 'XIII', 'XIV']"
                v-model="degree"></SelectField>
            <TextAreaField :length="4096" v-model="name" :label="'Название:'" :placeholder="'Введите Название...'" />
            <button @click="create">Добавить 'Чин'</button>
            <div :class="'list'">
                <RankItem v-for="item in value" :onDelete="get" :rank="item"></RankItem>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
import TextField from './TextField.vue';
import ActivityItem from '../ActivityItem.vue';
import TextAreaField from './TextAreaField.vue';
import DateField from './DateField.vue';
import SelectField from './SelectField.vue';
import RankItem from '../RankItem.vue';

const SERVER_PORT = '5050';
const SERVER_HOST = '194.87.232.70';

export default {
    created() {
        this.get();
    },
    components: {
        TextField,
        ActivityItem,
        SelectField,
        RankItem,
        DateField
    },
    data() {
        return {
            value: [],
            startDate: '',
            endDate: '',
            name: '',
            description: '',
            place: '',
            degree: ''
        }
    },
    props: {
        person: undefined
    },
    methods: {
        padTo2Digits(num) {
            return num.toString().padStart(2, '0');
        },

        formatDate(date) {
            return [
                this.padTo2Digits(date.getDate()),
                this.padTo2Digits(date.getMonth() + 1),
                date.getFullYear(),
            ].join('.');
        },
        get() {
            setTimeout(() => axios.get(`http://${SERVER_HOST}:${SERVER_PORT}/api/rank`, { params: { person_id: this.$props.person.id } }).then((response) => { this.value = response.data; console.log('get'); }), 500);
        },
        async create() {
            axios.post(`http://${SERVER_HOST}:${SERVER_PORT}/api/rank`, {
                "person_id": this.$props.person.id,
                "start_date": this.formatDate(new Date(this.startDate)),
                "end_date": this.formatDate(new Date(this.endDate)),
                "degree": this.degree,
                "name": this.name
            }).then(this.get);
        }
    },
    components: { TextField, ActivityItem, TextAreaField, DateField, SelectField, RankItem }
}
</script>

<style scoped>

</style>