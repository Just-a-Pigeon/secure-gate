<script setup lang="ts">
</script>

<template>
  <main>
    <header-base />
    <RouterView />
  </main>
  <footer-base />
</template>

<style scoped>
@reference "tailwindcss";

main {
  @apply flex-1 w-full p-4 max-w-3/4 mx-auto;
}

@media (max-width: 800px) {
  main {
    @apply max-w-9/10;
  }
}
</style>
