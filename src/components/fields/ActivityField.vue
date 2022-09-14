<template>
    <div :class="'field'">
        <div>
            <TextField :length="32" v-model="name" :label="'Название деятельности:'"
                :placeholder="'Введите название деятельности...'" />
            <TextField :length="32" v-model="place" :label="'Место деятельности:'"
                :placeholder="'Введите место деятельности...'" />
            <TextAreaField :length="4096" v-model="description" :label="'Описание:'"
                :placeholder="'Введите описание...'" />

            <button @click="create">Добавить 'Активность'</button>
            <div :class="'list'">
                <ActivityItem v-for="item in value" :onDelete="get" :activity="item"></ActivityItem>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
import TextField from './TextField.vue';
import ActivityItem from '../ActivityItem.vue';
import TextAreaField from './TextAreaField.vue';

const SERVER_PORT = '5050';
const SERVER_HOST = '194.87.232.70';

export default {
    created() {
        this.get();
    },
    components: {
        TextField,
        ActivityItem
    },
    data() {
        return {
            value: [],
            name: '',
            description: '',
            place: ''
        }
    },
    props: {
        person: undefined
    },
    methods: {
        get() {
            setTimeout(() => axios.get(`http://${SERVER_HOST}:${SERVER_PORT}/api/activity`, { params: { person_id: this.$props.person.id } }).then((response) => { this.value = response.data; console.log('get'); }), 500);
        },
        async create() {
            axios.post(`http://${SERVER_HOST}:${SERVER_PORT}/api/activity`, {
                "person_id": this.$props.person.id,
                "name": this.name,
                "description": this.description,
                "place": this.place
            }).then(this.get);
        }
    },
    components: { TextField, ActivityItem, TextAreaField }
}
</script>

<style>
.field {
    padding: 5px;
}

.list {
    border: 1px solid black;
    border-collapse: separate;
    border-spacing: 0;
}
</style>