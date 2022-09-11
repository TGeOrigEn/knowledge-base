<template>
    <div>
        <label>{{ label }}</label>
        <input :disabled="disabled" :placeholder="placeholder" type="text" :value="modelValue" @input="updateValue" />
    </div>
</template>

<script>
export default {
    props: {
        modelValue: {
            type: String,
            required: false,
        },
        disabled: {
            type: Boolean,
            required: false,
            default: false
        },
        label: {
            type: String,
            required: true,
        },
        placeholder: {
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
    border: 0;
    background-color: white;
    color: black;
}
</style>