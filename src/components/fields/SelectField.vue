<template>
    <div>
        <label>{{ label }}</label>
        <select :maxlength="length" :disabled="disabled" :value="modelValue" @input="updateValue">
            <option :value="option" v-for="option in options">{{ option }}</option>
        </select>
    </div>
</template>
  
<script>
export default {
    props: {
        modelValue: {
            type: String,
            required: false,
        },
        length: {
            type: Number,
            require: true
        },
        options: {
            type: Array,
            required: true,
        },
        disabled: {
            type: Boolean,
            required: false,
            default: false
        },
        label: {
            type: String,
            required: true,
        }
    },
    methods: {
        updateValue(event) {
            this.$emit('update:modelValue', event.target.value);
        }
    }
}
</script>

<style scoped>
select:disabled {
    background-color: white;
    color: black;
}
</style>