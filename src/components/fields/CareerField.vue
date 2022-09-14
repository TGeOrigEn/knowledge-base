<template>
    <div :class="'field'">
        <div>
            <DateField :label="'Дата начала:'" v-model="startDate"></DateField>
            <DateField :label="'Дата окончания:'" v-model="endDate"></DateField>
            <TextField :length="64" v-model="post" :label="'Должность:'" :placeholder="'Введите должность...'" />
            <TextField :length="64" v-model="place" :label="'Место:'" :placeholder="'Введите место...'" />
            <button @click="create">Добавить 'Карьеру'</button>
            <div :class="'list'">
                <CareerItem v-for="item in value" :onDelete="get" :career="item"></CareerItem>
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
import CareerItem from '../CareerItem.vue';

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
            post: '',
            place: '',
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
            setTimeout(() => axios.get(`http://${SERVER_HOST}:${SERVER_PORT}/api/career`, { params: { person_id: this.$props.person.id } }).then((response) => { this.value = response.data; console.log('get'); }), 500);
        },
        async create() {
            axios.post(`http://${SERVER_HOST}:${SERVER_PORT}/api/career`, {
                "person_id": this.$props.person.id,
                "start_date": this.formatDate(new Date(this.startDate)),
                "end_date": this.formatDate(new Date(this.endDate)),
                "post": this.post,
                "place": this.place
            }).then(this.get);
        }
    },
    components: { TextField, ActivityItem, TextAreaField, DateField, SelectField, RankItem, CareerItem }
}
</script>

<style scoped>

</style>