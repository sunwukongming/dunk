<script setup lang="ts">
import Button from '@/components/Button.vue'

import { ref, onMounted, onUnmounted } from 'vue'

const el = ref<HTMLDivElement>()
const zoom = ref(1)
const cutHorizontal = ref(0)
const cutVertical = ref(0)

const handleResize = () => {
  if (el.value) {
    if (el.value.offsetWidth / el.value.offsetHeight > 16 / 9) {
      zoom.value = el.value.offsetWidth / 1920
      cutVertical.value = (el.value.offsetWidth / (16 / 9) - el.value.offsetHeight) / 2
      cutHorizontal.value = 0
    } else if (el.value.offsetWidth / el.value.offsetHeight < 16 / 9) {
      zoom.value = el.value.offsetHeight / 1080
      cutVertical.value = 0
      cutHorizontal.value = (el.value.offsetHeight * (16 / 9) - el.value.offsetWidth) / 2
    } else {
      zoom.value = 1
      cutVertical.value = 0
      cutHorizontal.value = 0
    }
    console.log('zoom:', zoom.value, cutHorizontal.value, cutVertical.value)
  }
}

onMounted(() => {
  // 添加事件监听
  window.addEventListener('resize', handleResize)

  // 初始化缩放
  handleResize()
})

onUnmounted(() => {
  // 清理事件监听
  window.removeEventListener('resize', handleResize)
})
</script>

<template>
  <div
    ref="el"
    class="bg-[url('@/assets/images/svg/background.svg')] h-screen w-screen bg-no-repeat bg-center bg-cover overflow-auto scrollbar-none"
  >
    <!-- 固定画布(1920x1080) 等比缩放到任意分辨率，使 1k/2k/4k 视觉一致 -->
    <div
      :style="{
        width: `${650 * zoom}px`,
        marginLeft: `${700 * zoom - cutHorizontal}px`,
        marginTop: `${40 * zoom - cutVertical}px`,
      }"
    >
      <div>
        <div class="flex flex-col justify-center overflow-hidden">
          <div class="flex">
            <img class="grow" src="@/assets/images/svg/title.svg" />
          </div>
          <div
            class="grow flex flex-col gap-1"
            :style="{
              marginTop: `${50 * zoom}px`,
            }"
          >
            <div class="grid grid-cols-2 gap-6">
              <Button class="grid-cols-1 aspect-3/1 grow">
                <img
                  :style="{
                    width: `${32 * zoom}px`,
                    height: `${32 * zoom}px`,
                  }"
                  src="@/assets/images/icon/dollar.svg"
                />
                <div
                  class="truncate"
                  :style="{
                    fontSize: `${32 * zoom}px`,
                  }"
                >
                  BUY $DUNK
                </div>
              </Button>
              <Button class="grid-cols-1 aspect-3/1 grow" disabled>
                <img
                  :style="{
                    width: `${32 * zoom}px`,
                    height: `${32 * zoom}px`,
                  }"
                  src="@/assets/images/icon/star.svg"
                />
                <div
                  class="truncate"
                  :style="{
                    fontSize: `${32 * zoom}px`,
                  }"
                >
                  FOLLOW TWITTER
                </div>
              </Button>
            </div>
            <div class="grid grid-cols-2 gap-6">
              <Button class="grid-cols-1 aspect-3/1 grow">
                <img
                  :style="{
                    width: `${32 * zoom}px`,
                    height: `${32 * zoom}px`,
                  }"
                  src="@/assets/images/icon/group-add.svg"
                />
                <div
                  class="truncate"
                  :style="{
                    fontSize: `${32 * zoom}px`,
                  }"
                >
                  JOIN TELEGRAM
                </div>
              </Button>
              <Button class="grid-cols-1 aspect-3/1 grow">
                <img
                  :style="{
                    width: `${32 * zoom}px`,
                    height: `${32 * zoom}px`,
                  }"
                  src="@/assets/images/icon/user-add.svg"
                />
                <div
                  class="truncate"
                  :style="{
                    fontSize: `${32 * zoom}px`,
                  }"
                >
                  JOIN DISCORD
                </div>
              </Button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
