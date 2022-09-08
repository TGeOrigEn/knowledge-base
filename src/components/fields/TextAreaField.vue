<template>
    <div>
        <label>{{ label }}</label>
        <textarea v-model="text" @placeholder="placeholder" />
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
        placeholder: {
            type: String,
            required: true
        }
    }
}
</script>
  
<style>
</style>
  