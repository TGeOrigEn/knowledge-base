<template>
    <div>
        <span>{{ startDate }} - {{ endDate }}</span>
        <span> — Класс: {{ degree }}, {{ rank }};</span>
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
        degree: {
            type: String,
            required: true
        },
        rank: {
            type: String,
            required: true
        }
    }
}
</script>
  
<style>
</style>
  