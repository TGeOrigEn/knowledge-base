<template>
    <div>
        <span>{{ activity }}:&nbsp</span>
        <span>{{ description }};</span>
    </div>
</template>
  
<script>
//activity: Научная, Культурно-просветительская, Благотворительная
export default {
    props: {
        activity: {
            type: String,
            required: true
        },
        description: {
            type: String,
            required: true
        }
    }
}
</script>
  
<style>
</style>
  