<template>
    <div>
        <pre>{{ text }}</pre>
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
  