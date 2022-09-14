<template>
    <div>
        <span>{{ startDate }} - {{ endDate }}</span>
        <span> — {{ career }}, {{ place }};</span>
    </div>
</template>
  
<script>
export default {
    props: {
        startDate: {
            type: String,
            required: true
        },
        endDate: {
            type: String,
            required: true
        },
        career: {
            type: String,
            required: true
        },
        place: {
            type: String,
            required: true
        }
    }
}
</script>
  
<style scoped >
span::selection {
    background: none;
}

span {
    cursor: pointer;
}
</style>
  