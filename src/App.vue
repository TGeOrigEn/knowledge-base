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
        <!-- <td>
          <FullNameCell :name="person.fullName.name" :surname="person.fullName.surname"
            :patronymic="person.fullName.patronymic" :yearBirth="person.fullName.yearBirth"
            :religion="person.fullName.religion" :origin="person.fullName.origin" />
        </td> -->
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
          <SimapleCell :text="person.family" />
        </td>
        <!-- <td>
          <ActivityCell v-for="item in person.activity" :activity="item.activity" :description="item.description" />
        </td>
        <td>
          <EducationCell :level="person.education.level" :place="person.education.place"
            :establishment="person.education.establishment" />
        </td>
        <td>
          <CareerCell v-for="item in person.career" :startDate="item.startDate" :endDate="item.endDate"
            :career="item.career" :place="item.place" />
        </td>
        <td>
          <RankCell v-for="item in person.rank" :startDate="item.startDate" :endDate="item.endDate"
            :degree="item.degree" :rank="item.rank" />
        </td> -->
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

import P from './entities/Person'

// new P.Person(
//         new P.FullName("1", "Гурьев", "Алексей", "Васильевич", "1842", "православное", "из духовного звания"),
//         "Темно-бронзовая медаль в память войны 1853-1856 годов на ленте ордена Андрея Первозванного для ношения на груди",
//         "Жалованье 450 рублей Столовых 200 рублей Итого 650 рублей",
//         "Не имеет",
//         "Женат на Марии Яковлевой, имеет дочерей: - Клавдия, 02.11.1893 - Серафима, 23.06.1858",
//         [new P.Activity("Научная деятельность", "сформировал основы чего-то и оформил как научный труд", "МЕСТО")],
//         new P.Education("Высшее", "Семинария", "Воронежская духовная"),
//         [new P.Career("5.04.1849", "29.09.1850", "Регистратор", "Томская губерния")],
//         [new P.Rank("5.04.1849", "29.09.1850", "VI", "Статский советник")],
//       )]

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
      persons: []
    }
  },
  mounted() {
    this.test();
  },
  methods: {

    test() {
      this.value++;
    },

    getAll() {
      let value;
      axios.get("http://194.87.232.70:8085/api/person")
        .then(response => value = response.data);
      return value;
    },

    async getFullName(id) {
      axios.get("http://194.87.232.70:8085/api/person/" + id)
        .then(response => console.log(response.data));
    },

    async refresh() {
      axios.get("http://194.87.232.70:8085/api/person")
        .then(response => this.persons = response.data)
        .catch(error => console.log(error));
    },
    
    async create() {
      axios.post("http://194.87.232.70:8085/api/person", {
        family: "",
        salary: "",
        awards: "",
        property: "",
        fullName: {
          surname: "",
          name: "",
          patronymic: "",
          yearBirth: "",
          religion: "",
          origin: ""
        },
        education: {
          level: "",
          establishment: "",
          place: ""
        },
        activity: [
          {
            activity: "",
            description: "",
            place: ""
          },
          {
            activity: "",
            description: "",
            place: ""
          },
        ],
        career: [
          {
            startDate: "",
            endDate: "",
            career: "",
            place: ""
          },
          {
            startDate: "",
            endDate: "",
            career: "",
            place: ""
          },
        ],
        rank: [
          {
            startDate: "",
            endDate: "",
            degree: "",
            rank: ""
          },
          {
            startDate: "",
            endDate: "",
            degree: "",
            rank: ""
          },
        ]
      })
        .then(response => console.log(response.data));
    }
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
