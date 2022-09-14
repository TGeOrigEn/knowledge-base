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
  
<style scoped >
p::selection {
    background: none;
}

p {
    cursor: pointer;
}
</style>
  