<template>
    <Button :isDisabled="sortable" :isArrow="true" :text="text"></Button>
    <Button :isArrow="true"></Button>
</template>

<script>
import Button from '@/components/Button.vue';

export default {
    components: {
        Button
    },
    props: {
        sortable: {
            type: Boolean,
            require: false,
            default: fa
        },
        text: {
            type: String,
            required: true,
            default: ''
        },
    },
}
</script>

<style scoped>
</style>
