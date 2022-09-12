<template>
    <div>
        <label>{{ label }}
            <textarea :maxlength="length" :disabled="disabled" :placeholder="placeholder" type="text" :value="modelValue"
                @input="updateValue" />
        </label>
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
        length: {
            type: Number,
            require: true
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
textarea:disabled {
    background-color: white;
    color: black;
}
</style>