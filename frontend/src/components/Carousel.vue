<template>
  <div class="carousel col-12">
    <b-carousel
      id="carousel-fade"
      style="text-shadow: 0px 0px 2px #000"
      fade
      indicators
      img-width="1024"
      img-height="480"
    >
      <b-carousel-slide img-src="../assets/img/Slide1.jpg"></b-carousel-slide>
      <b-carousel-slide img-src="../assets/img/Slide2.jpg"></b-carousel-slide>
      <b-carousel-slide img-src="../assets/img/Slide3.jpg"></b-carousel-slide>
    </b-carousel>
  </div>
</template>

<script>
export default {
  name: "Carousel",
};
</script>

<style scoped>
</style>