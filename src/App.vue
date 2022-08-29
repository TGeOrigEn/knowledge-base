<template>
  <Header :text="'Фамилия'"></Header>
</template>

<script>
import Button from '@/components/Button';
import Header from '@/components/Header';

export default {
  components: {
    Button,
    Header
  },
  data() {
    return {
      count: 0
    }
  },
  methods: {
    log() {
      console.log("123");
    }
  }
}
</script>

<style>
</style>
