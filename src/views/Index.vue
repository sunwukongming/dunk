<script setup lang="ts">
defineOptions({
  name: 'IndexView',
})

import background from '@/assets/images/background.png'
import center from '@/assets/images/center.png'
import Button from '@/components/Button.vue'
</script>

<template>
  <div
    :style="{ backgroundImage: `url(${background})` }"
    class="bg-no-repeat bg-center bg-cover w-screen h-screen min-w-[1366px] min-h-[768px] flex justify-center"
  >
    <div class="mt-10 w-100 2xl:w-120">
      <div class="flex">
        <img class="grow" :src="center" />
      </div>
      <div class="mt-10 flex flex-col gap-1">
        <div class="grid grid-cols-2 gap-6">
          <Button class="grid-cols-1 aspect-3/1 grow">
            <img class="size-6" src="@/assets/images/icon/dollar.svg" />
            <img class="h-5 2xl:h-6" src="@/assets/images/text/buy-dunk.svg" />
            <!-- <div class="2xl:text-lg truncate">BUY $DUNK</div> -->
          </Button>
          <Button class="grid-cols-1 aspect-3/1 grow" disabled>
            <img class="size-6" src="@/assets/images/icon/star.svg" />
            <img class="h-4 2xl:h-5" src="@/assets/images/text/follow-twitter.svg" />
            <!-- <div class="2xl:text-lg truncate">FOLLOW TWITTER</div> -->
          </Button>
        </div>
        <div class="grid grid-cols-2 gap-6">
          <Button class="grid-cols-1 aspect-3/1 grow">
            <img class="size-6" src="@/assets/images/icon/group-add.svg" />
            <img class="h-4 2xl:h-5" src="@/assets/images/text/join-telegram.svg" />
            <!-- <div class="2xl:text-lg truncate">JOIN TELEGRAM</div> -->
          </Button>
          <Button class="grid-cols-1 aspect-3/1 grow">
            <img class="size-6" src="@/assets/images/icon/user-add.svg" />
            <img class="h-4 2xl:h-5" src="@/assets/images/text/join-discord.svg" />
            <!-- <div class="2xl:text-lg truncate">JOIN DISCORD</div> -->
          </Button>
        </div>
      </div>
    </div>
  </div>
</template>
