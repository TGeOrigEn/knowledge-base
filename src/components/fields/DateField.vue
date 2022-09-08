<template>
    <div>
        <label>{{ label }}</label>
        <input v-model="text" type="date">
    </div>
</template>
  
<script>
export default {
    data() {
        return {
            text: ""
        };
    },
    props: {
        label: {
            type: String,
            required: true
        },
    }
}
</script>
  
<style>
</style>
  