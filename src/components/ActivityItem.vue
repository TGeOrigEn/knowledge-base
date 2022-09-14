<template>
    <div>
        <span>{{ this.$props.activity.name }}:&nbsp</span>
        <span>{{ this.$props.activity.description }};</span>
        <button @click="remove()">Удалить</button>
    </div>
</template>
  
<script>
import axios from 'axios';

const SERVER_PORT = '5050';
const SERVER_HOST = '194.87.232.70';

export default {
    props: {
        activity: {
            required: true
        },
        onDelete: {
            type: Function
        }
    },
    methods: {
        remove() {
            axios.delete(`http://${SERVER_HOST}:${SERVER_PORT}/api/activity/${this.$props.activity.id}`).finally(this.$props.onDelete());
        }
    }
};
</script>
  
<style>

</style>