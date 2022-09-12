<template>
    <div>
        <label>{{ label }}</label>
        <input :maxlength="length" :disabled="disabled" type="date" :value="modelValue" @input="updateValue" required />
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
input:disabled {
    background-color: white;
    color: black;
}
</style>