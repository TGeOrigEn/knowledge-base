<template>
    <button :disabled="isDisabled" :class="classes" :style="{ '--background-color': color }">
        {{ text }}
    </button>
</template>

<script>
export default {
    computed: {
        classes() {
            return {
                'button': true,
                'arrow': this.isArrow,
                'direction-up': this.arrowDirection === 'Up',
                'direction-down': this.arrowDirection === 'Down'
            }
        }
    },
    props: {
        isArrow: {
            type: Boolean,
            required: false,
            default: false
        },
        isDisabled: {
            type: Boolean,
            required: false,
            default: false
        },
        arrowDirection: {
            type: String,
            required: false,
            default: 'Down'
        },
        text: {
            type: String,
            required: false,
            default: ''
        },
        color: {
            type: String,
            required: false,
            default: '#066bff',
        }
    }
}
</script>

<style scoped>
.button {
    background-color: var(--background-color);
    color: whitesmoke;
    text-decoration: none;
    border-radius: 0px;
    padding: 5px 5px;
    border: 0;
    transition: 0.5s;
}

.button:hover {
    background-color: var(--background-color);
    transition: 0.5s;
}

.button:active {
    box-shadow: 0px 0px 3px 1px var(--background-color);
    background-color: var(--background-color);
    transition: 0.1s;
}

.button:disabled {
    pointer-events: none;
    opacity: 0.8;
}

.arrow::after {
    display: inline-block;
    vertical-align: .255em;
    content: "";
    border-top: .3em solid;
    border-right: .3em solid transparent;
    border-bottom: 0;
    border-left: .3em solid transparent;
    margin-left: 5px;
    margin-right: 5px
}

.direction-up::after {
    transform: rotate(180deg);
}

.direction-down::after {
    transform: rotate(0deg);
}
</style>
