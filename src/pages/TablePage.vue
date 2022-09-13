<template>
    <div>
        <button @click="refresh">Обновить</button>
        <button @click="create">Создать</button>
        <div :class="'tableFixHead'">
            <table>
                <thead>
                    <tr>
                        <th>№
                            <!-- <div @mousedown="handlerDown" @mousemove="handlerMove" @mouseup="handlerUp"
                                :class="'resize-handler'"></div> -->
                        </th>
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
                    <tr v-for="(person, index) in persons" :key="index" @dblclick="click({...person})">
                        <td>
                            {{index + 1}}
                        </td>
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
                            <EducationCell :level="person.level_education"
                                :place="person.location_educational_institution"
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
    mounted() {
        //createTable();
        const handler = this.createHandler();
        const table = document.getElementsByTagName('table')[0];
        const theader = table.getElementsByTagName('thead')[0]
        const headers = theader.children;
        headers.appendChild(handler);
        handler.addEventListener('mousedown', this.handlerDown);
        handler.addEventListener('mouseup', this.handlerUp);
        handler.addEventListener('mousemove', this.handlerMove);
    },
    beforeUpdate() {

        const resizeHandlers = document.getElementsByClassName('resize-handler');
        console.log(resizeHandlers[0]);
        const table = document.getElementsByTagName('table');
        console.log(resizeHandlers[0].style.height);
        console.log(table[0].offsetHeight);
        resizeHandlers[0].style.height = `${table[0].offsetHeight}px`;
    },
    created() {
        this.refresh();
    },
    data() {
        return {
            handler: {
                currentColumnWidth: undefined,
                nextColumnWidth: undefined,
                currentColumn: undefined,
                nextColumn: undefined,
                pageX: undefined,
            },
            show: false,
            persons: [],
            activitys: [],
            careers: [],
            ranks: [],
            person: {}
        }
    },
    methods: {
        createHandler() {
            const handler = document.createElement('div');
            handler.className = 'resize-handler';
            return handler;
        },

        handlerDown(event) {
            console.log("down");
            const handler = this.handler;

            handler.currentColumn = event.target.parentElement;
            handler.nextColumn = handler.currentColumn.nextElementSibling;
            handler.pageX = event.pageX;

            const paddingDifference = this.getPaddingDifference(handler.currentColumn);


            console.log
            handler.currentColumnWidth = handler.offsetWidth - paddingDifference;

            if (handler.nextColumn)
                handler.nextColumnWidth = handler.offsetWidth - paddingDifference;
        },

        handlerUp() {
            console.log("up");
            this.handler.currentColumn = undefined;
            this.handler.nextColumn = undefined;
            this.handler.pageX = undefined;
        },

        handlerMove(event) {
            console.log("move");
            const handler = this.handler;

            if (!handler.currentColumn) return;
            const differencePageX = event.pageX - handler.pageX;
            console.log(`differencePageX: ${differencePageX}`);

            if (handler.nextColumn)
                handler.nextColumn.style.width = `${(handler.nextColumnWidth - differencePageX)}px`;
            handler.currentColumn.style.width = `${handler.currentColumnWidth + differencePageX}px`;
        },

        getPaddingDifference(column) {
            if (this.getAttributeValue(column, 'box-sizing') == 'border-box') return 0;
            const paddingRight = this.getAttributeValue(column, 'padding-right');
            const paddingLeft = this.getAttributeValue(column, 'padding-left');
            return parseInt(paddingLeft) + parseInt(paddingRight);
        },

        getAttributeValue(element, attributeName) {
            return window.getComputedStyle(element, null).getPropertyValue(attributeName);
        },

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
.resize-handler {
    position: absolute;
    cursor: col-resize;
    user-select: none;
    background-color: red;
    width: 5px;
    right: 0;
    top: 0;
}

.tableFixHead {
    overflow: auto;
    height: 500px;
}

.tableFixHead thead th {
    position: sticky;
    top: 0;
    z-index: 1;
}

/* Just common table stuff. Really. */
table {
    border-collapse: collapse;
    width: 100%;
}

th,
td {
    text-align: center;
    padding: 8px 16px;
}

th {
    background: #eee;
}

*/ table,
th,
td {
    text-align: center;
    border: 1px solid black;
}
</style>
  