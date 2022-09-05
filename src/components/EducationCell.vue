<template>
    <div>
        <span>{{ level }};</span>
        <br />
        <span>{{ place }};</span>
        <br />
        <span>{{ establishment }}.</span>
    </div>
</template>
  
<script>
export default {
    props: {
        level: {
            type: String,
            required: true
        },
        place: {
            type: String,
            required: true
        },
        establishment: {
            type: String,
            required: true
        }
    }
}
</script>
  
<style>
</style>
  