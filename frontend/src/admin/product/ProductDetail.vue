<template>
   <div>
    <h4>Thông tin sản phẩm</h4>
    <b-tabs content-class="mt-3">
        <b-tab title="Produt" active>
           <div>
               <p>{{product.name}}</p>
           </div>
        </b-tab>
        <b-tab title="Color">

        </b-tab>
    </b-tabs>
</div>
</template>

<script>
    export default {
        name: "productdetail",
        data(){
            return{
                product: {},
            }
        },
        mounted() {
            this.axios
            .get("http://127.0.0.1:8000/api/product/"+this.$route.params.url)
            .then((response)=>{
                this.product = response.data.data;
            })
        },
    }
</script>

<style lang="scss" scoped>

</style>