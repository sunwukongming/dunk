<script setup lang="ts">
import Button from '@/components/Button.vue'

import { onMounted, onUnmounted, ref } from 'vue'

const el = ref<HTMLDivElement>()
const zoom = ref(1)
const cutHorizontal = ref(0)
const cutVertical = ref(0)
const ca = 'AX9s8YCScDJHekeyugJWi6LsCReEpzJJme9LAxLpump'

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

const open = (url: string) => {
  window.open(url, '_blank')
}

const copy = (s: string) => {
  if (navigator.clipboard && window.isSecureContext) {
    // 使用 Clipboard API (现代浏览器且在安全上下文)
    return navigator.clipboard
      .writeText(s)
      .then(() => {
        showToast('Address Copied')
        return true
      })
      .catch(() => false)
  } else {
    // 兼容老版本浏览器
    const textarea = document.createElement('textarea')
    textarea.value = s
    textarea.setAttribute('readonly', '')
    textarea.style.position = 'absolute'
    textarea.style.left = '-9999px'
    document.body.appendChild(textarea)
    textarea.select()
    try {
      const result = document.execCommand('copy')
      document.body.removeChild(textarea)
      if (result) {
        showToast('Address Copied')
      }
      return result
    } catch (e) {
      console.warn(e)
      document.body.removeChild(textarea)
      return false
    }
  }
}

const toast = () => {
  // 简易toast弹窗
  // 参数: msg 显示的消息, duration 显示时长（毫秒，默认2000ms）
  return (msg: string, duration = 2000) => {
    // 避免重复toast
    const old = document.getElementById('custom-toast-container')
    if (old) {
      old.remove()
    }

    const toast = document.createElement('div')
    toast.id = 'custom-toast-container'
    toast.innerText = msg
    Object.assign(toast.style, {
      position: 'fixed',
      left: '50%',
      top: '24px',
      transform: 'translateX(-50%)',
      minWidth: '120px',
      color: '#fff',
      background: 'rgba(0,0,0,0.75)',
      fontSize: '18px',
      padding: '16px 36px',
      borderRadius: '8px',
      textAlign: 'center',
      zIndex: 9999,
      pointerEvents: 'none',
      boxShadow: '0 4px 16px rgba(0,0,0,0.12)',
      maxWidth: '70vw',
      wordBreak: 'break-word',
      transition: 'opacity 0.25s',
      opacity: '1',
    })
    document.body.appendChild(toast)
    setTimeout(() => {
      toast.style.opacity = '0'
      setTimeout(() => {
        toast.remove()
      }, 300)
    }, duration)
  }
}

const showToast = toast()

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
    class="bg-[url('@/assets/images/svg/background-mobile.svg')] sm:bg-[url('@/assets/images/svg/background.svg')] h-screen w-screen bg-no-repeat bg-center bg-cover overflow-auto scrollbar-none"
  >
    <!-- 固定画布(1920x1080) 等比缩放到任意分辨率，使 1k/2k/4k 视觉一致 -->
    <div
      class="hidden sm:block"
      :style="{
        width: `${650 * zoom}px`,
        marginLeft: `${700 * zoom - cutHorizontal}px`,
        marginTop: `${40 * zoom - cutVertical}px`,
      }"
    >
      <div>
        <div class="flex flex-col justify-center overflow-hidden">
          <div
            class="flex relative"
            :style="{ width: `${650 * zoom}px`, height: `${630 * zoom}px` }"
          >
            <div class="absolute left-0 right-0 top-0 bottom-0 z-1">
              <div
                class="flex justify-center items-center"
                :style="{
                  marginTop: `${200 * zoom}px`,
                  fontSize: `${110 * zoom}px`,
                }"
              >
                DUNK.GAME
              </div>
              <div
                class="whitespace-normal break-all"
                :style="{
                  marginLeft: `${30 * zoom}px`,
                  marginRight: `${30 * zoom}px`,
                  fontSize: `${50 * zoom}px`,
                  lineHeight: `${60 * zoom}px`,
                }"
              >
                CA:{{ ca }}
              </div>
              <div class="flex justify-center items-center">
                <Button
                  class="aspect-3/1"
                  :style="{ height: `${60 * zoom}px`, fontSize: `${30 * zoom}px` }"
                  @click="copy(ca)"
                >
                  COPY
                </Button>
              </div>
            </div>
            <img class="grow" src="@/assets/images/svg/parchment.svg" />
          </div>
          <div class="grow flex flex-col gap-1" :style="{}">
            <div
              class="flex flex-col"
              :style="{
                marginTop: `${20 * zoom}px`,
                paddingLeft: `${45 * zoom}px`,
                paddingRight: `${45 * zoom}px`,
                gap: `${20 * zoom}px`,
              }"
            >
              <Button
                type="long"
                class="grid-cols-1 grow"
                :style="{ height: `${90 * zoom}px`, gap: `${4 * zoom}px` }"
                @click="open('https://jup.ag/tokens/AX9s8YCScDJHekeyugJWi6LsCReEpzJJme9LAxLpump')"
              >
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
              <Button
                type="long"
                class="grid-cols-1 grow"
                :style="{ height: `${90 * zoom}px`, gap: `${4 * zoom}px` }"
                @click="open('https://x.com/DUNKORACLE')"
              >
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
                  FOLLOW X
                </div>
              </Button>
              <Button
                type="long"
                class="grid-cols-1 grow"
                :style="{ height: `${90 * zoom}px`, gap: `${4 * zoom}px` }"
                @click="open('https://t.me/DUNKTOWIN')"
              >
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
            </div>
            <!-- <div
              class="grid grid-cols-2"
              :style="{
                gap: `${24 * zoom}px`,
              }"
            >
              <Button
                class="grid-cols-1 aspect-3/1 grow"
                @click="open('https://jup.ag/tokens/AX9s8YCScDJHekeyugJWi6LsCReEpzJJme9LAxLpump')"
              >
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
              <Button class="grid-cols-1 aspect-3/1 grow" @click="open('https://x.com/DUNKORACLE')">
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
            <div
              class="grid grid-cols-2"
              :style="{
                gap: `${24 * zoom}px`,
              }"
            >
              <Button
                class="grid-cols-1 aspect-3/1 grow"
                @click="open('https://t.me/+yAmuLbMSke43NTkx')"
              >
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
              <Button
                class="grid-cols-1 aspect-3/1 grow"
                @click="open('https://x.com/i/communities/1983927527539405104/')"
              >
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
                  JOIN COMMUNITY
                </div>
              </Button>
            </div> -->
          </div>
        </div>
      </div>
    </div>
    <div class="sm:hidden h-full flex flex-col justify-center items-center overflow-hidden">
      <div class="flex justify-center items-center relative">
        <div class="w-50 h-50 relative">
          <img class="relative z-10" src="@/assets/images/svg/logo-mobile.svg" />
          <img class="absolute -right-16 -bottom-20" src="@/assets/images/svg/side-mobile.svg" />
        </div>
      </div>
      <div
        class="flex flex-col items-center bg-[url('@/assets/images/svg/parchment-mobile.svg')] bg-no-repeat bg-center bg-cover w-90 h-64"
      >
        <div class="mt-30 text-4xl">DUNK.GAME</div>
        <div class="mt-1 text-xl">CA:{{ ca.substring(0, 30) }}</div>
        <div class="mt-1 grid grid-cols-3 items-center">
          <div></div>
          <div class="text-xl">{{ ca.substring(30) }}</div>
          <div class="flex justify-center">
            <Button class="aspect-3/1 w-20" @click="copy(ca)"> COPY </Button>
          </div>
        </div>
      </div>
      <div class="mt-2 flex flex-col gap-3">
        <Button
          type="long"
          class="grid-cols-1 gap-1 grow w-60 aspect-6/1 text-normal"
          @click="open('https://jup.ag/tokens/AX9s8YCScDJHekeyugJWi6LsCReEpzJJme9LAxLpump')"
        >
          <img class="size-6" src="@/assets/images/icon/dollar.svg" />
          <div class="truncate">BUY $DUNK</div>
        </Button>
        <Button
          type="long"
          class="grid-cols-1 grow aspect-6/1 text-normal"
          @click="open('https://x.com/DUNKORACLE')"
        >
          <img class="size-6" src="@/assets/images/icon/star.svg" />
          <div class="truncate">FOLLOW X</div>
        </Button>
        <Button
          type="long"
          class="grid-cols-1 grow aspect-6/1 text-normal"
          @click="open('https://t.me/DUNKTOWIN')"
        >
          <img class="size-6" src="@/assets/images/icon/group-add.svg" />
          <div class="truncate">JOIN TELEGRAM</div>
        </Button>
      </div>
    </div>
  </div>
</template>
