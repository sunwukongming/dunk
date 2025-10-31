<template>
  <button
    class="flex justify-center items-center gap-1 bg-contain bg-no-repeat bg-center outline-none cursor-pointer user-select-none disabled:cursor-not-allowed"
    :class="classes"
  >
    <slot></slot>
  </button>
</template>

<script setup lang="ts">
import { computed } from 'vue'
const props = defineProps<{
  type?: 'normal' | 'long'
}>()

const classes = computed(() => {
  if (props.type === 'long') {
    return "bg-[url('@/assets/images/svg/long-button-normal.svg')] hover:bg-[url('@/assets/images/svg/long-button-hover.svg')] disabled:bg-[url('@/assets/images/svg/long-button-disabled.svg')]"
  }
  return "bg-[url('@/assets/images/svg/button-normal.svg')] hover:bg-[url('@/assets/images/svg/button-hover.svg')] disabled:bg-[url('@/assets/images/svg/button-disabled.svg')]"
})
</script>
