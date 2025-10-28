<template>
  <button
    class="flex justify-center items-center gap-1 bg-contain bg-no-repeat bg-center cursor-pointer bg-[url('@/assets/images/svg/button-normal.svg')] hover:bg-[url('@/assets/images/svg/button-hover.svg')] disabled:bg-[url('@/assets/images/svg/button-disabled.svg')] disabled:cursor-not-allowed"
  >
    <slot></slot>
  </button>
</template>

<script setup lang="ts"></script>
