<template>
    <div>
        <label>{{ label }}</label>
        <select>
            <option @click="" v-for="option in options">{{ option }}</option>
        </select>
    </div>
</template>
  
<script>
export default {
    data() {
        return {
            selected: ''
        };
    },
    methods: {
        setSelected(event) {
            selected = event.target.textContent;
        }
    },
    props: {
        options: {
            type: Array,
            required: true
        },
        label: {
            type: String,
            required: true
        },
    }
}
</script>
  
<style>
</style>
  