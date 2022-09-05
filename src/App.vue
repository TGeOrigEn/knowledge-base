<template>
  <table>
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
      <tr>
        <td>
          <FullNameCell name="Алексей" surname="Гурьев" patronymic="Васильевич" yearBirth="1842" religion="православное"
            origin="из духовного звания" />
        </td>
        <td>
          <SimapleCell
            text="Темно-бронзовая медаль в память войны 1853-1856 годов на ленте ордена Андрея Первозванного для ношения на груди" />
        </td>
        <td>
          <SimapleCell text="Жалованье 450 рублей; Столовых 200 рублей; Итого 650 рублей" />
        </td>
        <td>
          <SimapleCell text="Не имеет" />
        </td>
        <td>
          <SimapleCell text="Женат на Марии Яковлевой, имеет дочерей: - Клавдия, 02.11.1893 - Серафима, 23.06.1858" />
        </td>
        <td>
          <ActivityCell activity="Научная деятельность"
            description="сформировал основы чего-то и оформил как научный труд" />
        </td>
        <td>
          <EducationCell level="Высшее" place="Воронежская духовная" establishment="Семинария" />
        </td>
        <td>
          <SimapleCell text="5.04.1849 - 29.09.1850 — допущен к должности помощника Регистратора" />
        </td>
        <td>
          <SimapleCell text="30.09.1854-28.11.1857 — произведен в губернские секретари со старшинством" />
        </td>
      </tr>
    </tbody>
  </table>
</template>

<script>
import PreformattedCell from './components/PreformattedCell.vue';
import FullNameCell from './components/FullNameCell.vue';
import SimapleCell from './components/SimpleCell.vue';
import EducationCell from './components/EducationCell.vue';
import ActivityCell from './components/ActivityCell.vue';

export default {
  components: {
    PreformattedCell,
    EducationCell,
    ActivityCell,
    FullNameCell,
    SimapleCell
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
