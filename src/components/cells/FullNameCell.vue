<template>
  <div>
    <span>{{ surname }}&nbsp</span>
    <span>{{ name }}&nbsp</span>
    <span>{{ patronymic }};</span>
    <br />
    <span>Год рождения: {{ yearBirth }};</span>
    <br />
    <span>Вероисповедание: {{ religion }};</span>
    <br />
    <span>Происхождение: {{ origin }}.</span>
  </div>
</template>

<script>
//religion: Православное, Римско-католическое, Евангельско-лютеранское, Иное
export default {
  props: {
    name: {
      type: String,
      required: true
    },
    surname: {
      type: String,
      required: true
    },
    patronymic: {
      type: String,
      required: true
    },
    yearBirth: {
      type: String,
      required: true
    },
    religion: {
      type: String,
      required: true
    },
    origin: {
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
