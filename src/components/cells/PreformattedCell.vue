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
  
<style scoped >
pre::selection {
    background: none;
}

pre {
    cursor: pointer;
}
</style>
  