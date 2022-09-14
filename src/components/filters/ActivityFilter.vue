<template>
    <div :class="'table-header-buttons-group'">
        <button :class="'table-header-button'">Деятельность</button>
        <button :style="{flex: '1'}" :class="'dropdown table-header-button dropdown-toggle'">
            <div class="dropdown-content">
                <span>Название деятельности:</span>
                <TextField :length="32" :disabled="readonly" :label="'Равно:'" :placeholder="'Равно...'" />
                <TextField :length="32" :disabled="readonly" :label="'Содержит:'" :placeholder="'Содержит...'" />
                <span>Описание деятельности:</span>
                <TextField :length="32" :disabled="readonly" :label="'Равно:'" :placeholder="'Равно...'" />
                <TextField :length="32" :disabled="readonly" :label="'Содержит:'" :placeholder="'Содержит...'" />
            </div>
        </button>
    </div>
</template>

<script>
import TextField from '../fields/TextField.vue';

export default {
    components: {
        TextField
    },
    props: {
    },
    methods: {
    }
}
</script>

<style scoped>
.dropdown-content {
    display: none;
    position: absolute;
    inset: 0px auto auto 0px;
    transform: translate(0px, 18%);
    background-color: #f1f1f1;
    min-width: max-content;
    z-index: 1;
}

.dropdown:hover .dropdown-content {
    display: block;
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
</style>