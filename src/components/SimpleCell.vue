<template>
    <div>
        <p>{{ text }}</p>
    </div>
</template>
  
<script>
export default {
    props: {
        text: {
            type: String,
            required: true
        }
    }
}
</script>
  
<style>
</style>
  