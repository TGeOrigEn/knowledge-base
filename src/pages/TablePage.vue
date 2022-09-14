<template>
    <div>
        <button @click="refresh">Обновить</button>
        <button @click="create">Создать</button>
        <div>
            <table>
                <thead>
                    <tr>
                        <th :class="'table-header'">
                            <div :class="'targer-for-handler'"></div>
                            <div :class="'table-header-buttons-group'">
                                <button :class="'table-header-button dropdown-toggle dropdown-margin'">№</button>
                            </div>
                        </th>
                        <th :class="'table-header'">
                            <div :class="'targer-for-handler'"></div>
                            <div :class="'table-header-buttons-group'">
                                <button :class="'table-header-button'">БИО</button>
                                <button :style="{flex: '1'}" :class="'table-header-button dropdown-toggle'"></button>
                            </div>
                        </th>
                        <th :class="'table-header'">
                            <div :class="'targer-for-handler'"></div>
                            <div :class="'table-header-buttons-group'">
                                <button :class="'table-header-button'">Образование</button>
                                <button :style="{flex: '1'}" :class="'table-header-button dropdown-toggle'"></button>
                            </div>
                        </th>
                        <th :class="'table-header'">
                            <div :class="'targer-for-handler'"></div>
                            <div :class="'table-header-buttons-group'">
                                <button :class="'table-header-button'">Награды</button>
                                <button :style="{flex: '1'}" :class="'table-header-button dropdown-toggle'"></button>
                            </div>
                        </th>
                        <th :class="'table-header'">
                            <div :class="'targer-for-handler'"></div>
                            <div :class="'table-header-buttons-group'">
                                <button :class="'table-header-button'">Жалование</button>
                                <button :style="{flex: '1'}" :class="'table-header-button dropdown-toggle'"></button>
                            </div>
                        </th>
                        <th :class="'table-header'">
                            <div :class="'targer-for-handler'"></div>
                            <div :class="'table-header-buttons-group'">
                                <button :class="'table-header-button'">Имущетсво</button>
                                <button :style="{flex: '1'}" :class="'table-header-button dropdown-toggle'"></button>
                            </div>
                        </th>
                        <th :class="'table-header'">
                            <div :class="'targer-for-handler'"></div>
                            <div :class="'table-header-buttons-group'">
                                <button :class="'table-header-button'">Семейное
                                    положение</button>
                                <button :style="{flex: '1'}" :class="'table-header-button dropdown-toggle'"></button>
                            </div>
                        </th>

                        <th :class="'table-header'">
                            <div :class="'targer-for-handler'"></div>
                            <div :class="'table-header-buttons-group'">
                                <button :class="'table-header-button'">Деятельность</button>
                                <button :style="{flex: '1'}" :class="'table-header-button dropdown-toggle'"></button>
                            </div>
                        </th>
                        <th :class="'table-header'">
                            <div :class="'targer-for-handler'"></div>
                            <div :class="'table-header-buttons-group'">
                                <button :class="'table-header-button'">Карьера</button>
                                <button :style="{flex: '1'}" :class="'table-header-button dropdown-toggle'"></button>
                            </div>
                        </th>
                        <th :class="'table-header'">
                            <div :class="'targer-for-handler'"></div>
                            <div :class="'table-header-buttons-group'">
                                <button :class="'table-header-button'">Чин</button>
                                <button :style="{flex: '1'}" :class="'table-header-button dropdown-toggle'"></button>
                            </div>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(person, index) in persons" :key="index" @dblclick="click({...person})">
                        <td>
                            {{index + 1}}
                        </td>
                        <td>
                            <FullNameCell :surname="person.surname" :name="person.name" :patronymic="person.patronymic"
                                :yearBirth="person.date_birth" :religion="person.religion" :origin="person.origin" />
                        </td>
                        <td>
                            <EducationCell :level="person.level_education"
                                :place="person.location_educational_institution"
                                :establishment="person.educational_institution" />
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
                <Card :readonly="false" v-if="show" :onClose="close" :person="person"></Card>
            </table>
        </div>
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
import createTable from '../req/table'
import Card from '@/components/Card.vue';
import ActivityFilter from '@/components/filters/ActivityFilter.vue';

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

        ActivityFilter,
        Card
    },
    mounted() {
        createTable(document.getElementsByTagName('table')[0]);
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
.table-header {
    min-width: max-content;
}

.targer-for-handler {
    position: relative;
    min-width: min-content;
    user-select: none;
    right: 0;
    top: 0;
}

.table-header-button {
    border-radius: 0;
    min-width: fit-content;
    height: 100%;
    width: 100%;
}

.table-header-buttons-group {
    display: flex;
    height: 100%;
    width: 100%;
}

.dropdown-margin::after {
    margin-left: .255em;
}

.dropdown-toggle::after {
    display: inline-block;
    vertical-align: .255em;
    content: "";
    border-top: .3em solid;
    border-right: .3em solid transparent;
    border-bottom: 0;
    border-left: .3em solid transparent;
}

td::selection {
    background: none;
}

/* .resize-handler {
    position: absolute;
    cursor: col-resize;
    user-select: none;
    background-color: red;
    width: 5px;
    right: 0;
    top: 0;
} */

.tableFixHead {
    overflow: auto;
}

th {
    position: relative;
    top: 0;
    padding: 0;

}

/* Just common table stuff. Really. */
table {
    border-collapse: separate;
    border-spacing: 0;
    width: 100%;
}

th,
td {
    text-align: center;
    /* padding: 8px 16px; */
}

tr {
    height: 100%;
}

table,
th,
td {
    height: 100%;
    text-align: center;
    border: 1px solid black;
}
</style>
  