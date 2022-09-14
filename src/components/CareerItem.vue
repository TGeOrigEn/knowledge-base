<template>
    <div>
        <span>{{ this.$props.career.start_date }} - {{ this.$props.career.end_date }}</span>
        <span> — {{ this.$props.career.post }}, {{ this.$props.career.place }};</span>
        <button @click="remove()">Удалить</button>
    </div>
</template>
  
<script>
import axios from 'axios';

const SERVER_PORT = '5050';
const SERVER_HOST = '194.87.232.70';

export default {
    props: {
        career: {
            required: true
        },
        onDelete: {
            type: Function
        }
    },
    methods: {
        remove() {
            axios.delete(`http://${SERVER_HOST}:${SERVER_PORT}/api/career/${this.$props.career.id}`).finally(this.$props.onDelete());
        }
    }
};
</script>
  
<style>

</style>