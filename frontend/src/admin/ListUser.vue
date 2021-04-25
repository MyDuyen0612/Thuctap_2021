<template>
  <div>
     <h3 class="title">Danh sách User</h3>
    <inputtable :items="items" :fields="fields" :isAdd="false" />
  </div>
</template>

<script>
import Inputtable from "../components/Inputtable.vue";
export default {
  components: { Inputtable },
  data() {
    return {
      fields: [
        {
          key: "id",
          label: "User ID",
        },
        {
          key: "name",
          label: "Tên user",
        },
        {
          key: "email",
          label: "Email",
        },
      ],
      items: [],
    };
  },
  mounted(){
    this.axios
        .get("http://127.0.0.1:8000/api/listuser")
        .then((response) => {
          this.items = response.data;
        })
        .catch((error) => {
          alert(error.response);
        });
    }
  }
</script>

<style scoped>
.title{
  text-align: center;
  font-family: Arial, Helvetica, sans-serif;
  font-weight: bold;
  margin: 10px;
}
</style>>
