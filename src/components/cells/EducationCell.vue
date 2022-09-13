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

//level: нет образования, Начальное образование, Домашнее образование, Среднее образование, Среднее военное образование, Высшее образование, Высшее военное образование
//place: Неизвестно, Европейская часть, Сибирь

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
  
<style scoped >
    span::selection {
      background: none;
    }
    </style>
  