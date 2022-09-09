<template>
  <table>
    <button @click="refresh">Обновить</button>
    <button @click="create">Создать</button>
    <thead>
      <tr>
        <th>ФИО, год рождения, происхождение, вероисповедание</th>
        <th>Награды</th>
        <th>Жалование</th>
        <th>Имущество</th>
        <th>Семейное положение</th>
        <th>Научная, культурно-просветительская, благотворительная деятельность</th>
        <th>Образование</th>
        <th>Карьера</th>
        <th>Чин</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="person in persons">
        <td>
          <FullNameCell :surname="person.surname" :name="person.name" :patronymic="person.patronymic"
            :yearBirth="person.datebirth" :religion="person.religion" :origin="person.origin" />
        </td>
        <td>
          <SimapleCell :text="person.awards" />
        </td>
        <td>
          <SimapleCell :text="person.salary" />
        </td>
        <td>
          <SimapleCell :text="person.property" />
        </td>
        <td>
          <SimapleCell :text="person.maritalstatus" />
        </td>
        <td>
          <ActivityCell v-for="item in activitys.filter(x => x.personid === person.id)" :activity="item.name"
            :description="item.description" />
        </td>
        <td>
          <EducationCell :level="person.leveleducation" :place="person.locationeducationalinstitution"
            :establishment="person.educationalinstitution" />
        </td>
        <td>
          <CareerCell v-for="item in careers.filter(x => x.personid === person.id)" :startDate="item.startdate" :endDate="item.enddate"
            :career="item.post" :place="item.place" />
        </td>
        <td>
          <RankCell v-for="item in ranks.filter(x => x.personid === person.id)" :startDate="item.startdate" :endDate="item.enddate"
            :degree="item.degree" :rank="item.name" />
        </td>
      </tr>
    </tbody>
  </table>
</template>

<script>
import axios from 'axios';
import RankCell from './components/RankCell.vue';
import CareerCell from './components/CareerCell.vue';
import PreformattedCell from './components/PreformattedCell.vue';
import FullNameCell from './components/FullNameCell.vue';
import SimapleCell from './components/SimpleCell.vue';
import EducationCell from './components/EducationCell.vue';
import ActivityCell from './components/ActivityCell.vue';

const SERVER_PORT = '5050';
const SERVER_HOST = '194.87.232.70';

export default {
  components: {
    PreformattedCell,
    EducationCell,
    ActivityCell,
    FullNameCell,
    SimapleCell,
    CareerCell,
    RankCell
  },
  created() {
    this.refresh();
  },
  data() {
    return {
      persons: [],
      activitys: [],
      careers: [],
      ranks: []
    }
  },
  methods: {
    refresh() {
      axios.get('http://' + SERVER_HOST + ':' + SERVER_PORT + '/api/person')
        .then(response => this.persons = response.data);
      axios.get('http://' + SERVER_HOST + ':' + SERVER_PORT + '/api/activity')
        .then(response => this.activitys = response.data);
      axios.get('http://' + SERVER_HOST + ':' + SERVER_PORT + '/api/career')
        .then(response => this.careers = response.data);
      axios.get('http://' + SERVER_HOST + ':' + SERVER_PORT + '/api/rank')
        .then(response => this.ranks = response.data);
    },
  }
}
</script>

<style>
table,
th,
td {
  text-align: center;
  border: 1px solid black;
  border-collapse: collapse;
}
</style>
