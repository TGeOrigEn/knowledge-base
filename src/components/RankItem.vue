<template>
    <div>
        <span>{{ this.$props.rank.start_date }} - {{ this.$props.rank.end_date }}</span>
        <span> — Класс: {{ this.$props.rank.degree }}, {{ this.$props.rank.name }};</span>
        <button @click="remove()">Удалить</button>
    </div>
</template>
  
<script>
import axios from 'axios';

const SERVER_PORT = '5050';
const SERVER_HOST = '194.87.232.70';

export default {
    props: {
        rank: {
            required: true
        },
        onDelete: {
            type: Function
        }
    },
    methods: {
        remove() {
            axios.delete(`http://${SERVER_HOST}:${SERVER_PORT}/api/rank/${this.$props.rank.id}`).finally(this.$props.onDelete());
        }
    }
};
</script>
  
<style>

</style>