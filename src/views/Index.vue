<script setup lang="ts">
import Button from '@/components/Button.vue'
</script>

<template>
  <div
    class="bg-[url('@/assets/images/svg/background.svg')] bg-no-repeat bg-center bg-cover w-screen h-screen min-w-[1366px] min-h-[768px] flex justify-center"
  >
    <div class="mt-10 w-100 2xl:w-120">
      <div class="flex">
        <img class="grow" src="@/assets/images/svg/title.svg" />
      </div>
      <div class="mt-10 flex flex-col gap-1">
        <div class="grid grid-cols-2 gap-6">
          <Button class="grid-cols-1 aspect-3/1 grow">
            <img class="size-6" src="@/assets/images/icon/dollar.svg" />
            <!-- <img class="h-5 2xl:h-6" src="@/assets/images/text/buy-dunk.svg" /> -->
            <div class="text-xl 2xl:text-2xl truncate">BUY $DUNK</div>
          </Button>
          <Button class="grid-cols-1 aspect-3/1 grow" disabled>
            <img class="size-6" src="@/assets/images/icon/star.svg" />
            <!-- <img class="h-4 2xl:h-5" src="@/assets/images/text/follow-twitter.svg" /> -->
            <div class="text-xl 2xl:text-2xl truncate">FOLLOW TWITTER</div>
          </Button>
        </div>
        <div class="grid grid-cols-2 gap-6">
          <Button class="grid-cols-1 aspect-3/1 grow">
            <img class="size-6" src="@/assets/images/icon/group-add.svg" />
            <!-- <img class="h-4 2xl:h-5" src="@/assets/images/text/join-telegram.svg" /> -->
            <div class="text-xl 2xl:text-2xl truncate">JOIN TELEGRAM</div>
          </Button>
          <Button class="grid-cols-1 aspect-3/1 grow">
            <img class="size-6" src="@/assets/images/icon/user-add.svg" />
            <!-- <img class="h-4 2xl:h-5" src="@/assets/images/text/join-discord.svg" /> -->
            <div class="text-xl 2xl:text-2xl truncate">JOIN DISCORD</div>
          </Button>
        </div>
      </div>
    </div>
  </div>
</template>
