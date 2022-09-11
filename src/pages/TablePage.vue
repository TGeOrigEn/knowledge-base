<template>
    <div>
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
                <tr v-for="person in persons" @dblclick="click(person)">
                    <td>
                        <FullNameCell :surname="person.surname" :name="person.name" :patronymic="person.patronymic"
                            :yearBirth="person.date_birth" :religion="person.religion" :origin="person.origin" />
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
                        <SimapleCell :text="person.marital_status" />
                    </td>
                    <td>
                        <ActivityCell v-for="item in activitys.filter(x => x.person_id === person.id)"
                            :activity="item.name" :description="item.description" />
                    </td>
                    <td>
                        <EducationCell :level="person.level_education" :place="person.location_educational_institution"
                            :establishment="person.educational_institution" />
                    </td>
                    <td>
                        <CareerCell v-for="item in careers.filter(x => x.person_id === person.id)"
                            :startDate="item.start_date" :endDate="item.end_date" :career="item.post"
                            :place="item.place" />
                    </td>
                    <td>
                        <RankCell v-for="item in ranks.filter(x => x.person_id === person.id)"
                            :startDate="item.start_date" :endDate="item.end_date" :degree="item.degree"
                            :rank="item.name" />
                    </td>
                </tr>
            </tbody>
            <Card v-if="show" :onClose="close" :person="person"></Card>
        </table>
    </div>
</template>
  
<script>
import axios from 'axios';
import RankCell from '../components/cells/RankCell.vue';
import CareerCell from '../components/cells/CareerCell.vue';
import PreformattedCell from '../components/cells/PreformattedCell.vue';
import FullNameCell from '../components/cells/FullNameCell.vue';
import SimapleCell from '../components/cells/SimpleCell.vue';
import EducationCell from '../components/cells/EducationCell.vue';
import ActivityCell from '../components/cells/ActivityCell.vue';

import Card from '@/components/Card.vue';

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
        RankCell,
        Card
    },
    created() {
        this.refresh();
    },
    data() {
        return {
            show: false,
            persons: [],
            activitys: [],
            careers: [],
            ranks: [],
            person: {}
        }
    },
    methods: {
        refresh() {
            axios.get('http://' + SERVER_HOST + ':' + SERVER_PORT + '/api/person/all')
                .then(response => this.persons = response.data);
            axios.get('http://' + SERVER_HOST + ':' + SERVER_PORT + '/api/activity/all')
                .then(response => this.activitys = response.data);
            axios.get('http://' + SERVER_HOST + ':' + SERVER_PORT + '/api/career/all')
                .then(response => this.careers = response.data);
            axios.get('http://' + SERVER_HOST + ':' + SERVER_PORT + '/api/rank/all')
                .then(response => this.ranks = response.data);
        },
        click(value) {
            this.person = value;
            this.show = true;
        },
        close() {
            this.show = false;
        },
        create() {
            axios.post('http://' + SERVER_HOST + ':' + SERVER_PORT + '/api/person', {
                "surname": "[ФАМИЛИЯ]",
                "name": "[ИМЯ]",
                "patronymic": "[ОТЧЕСТВО]",
                "date_birth": "[00.00.0000]",
                "religion": "[РЕЛИГИЯ]",
                "origin": "[ПРОИСХОЖДЕНИЕ]",
                "level_education": "[УРОВЕНЬ ОБРАЗОВАНИЯ]",
                "educational_institution": "[УЧЕБНОЕ УЧРЕЖДЕНИЕ]",
                "location_educational_institution": "[РАСПОЛОЖЕНИЕ УЧЕБНОГО ЗАВЕДЕНИЯ]",
                "property": "[ИМУЩЕСТВО]",
                "awards": "[НАГРАДЫ]",
                "salary": "[ЖАЛОВАНИЕ]",
                "marital_status": "[СЕМЕЙНОЕ ПОЛОЖЕНИЕ]",
                "other": "[ПРОЧЕЕ]"
            });
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
  