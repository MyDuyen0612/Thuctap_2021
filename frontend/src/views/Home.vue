<template>
  <div class="admin">
    <div
      class="vertical-nav bg-white"
      id="sidebar"
      :class="isActive == true ? 'active' : ''"
    >
      <Menuuser :category="category"/>
    </div>

    <div
      class="page-content p-5"
      id="content"
      :class="isActive == true ? 'active' : ''"
    >
      <nav class="row">
        <button
          id="sidebarCollapse"
          type="button"
          class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4"
          @click="activeMenu"
        >
          <i class="fa fa-bars mr-8"></i>
        </button>
        <div class="col-9">
          <InputSearch />
        </div>
        <button
          id="sidebarCollapse"
          type="button"
          class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4"
          @click="logOut"
          v-show="user != null && user != ''"
        >
          Đăng xuất
        </button>
      </nav>
      <!-- <img src="../assets/img/home_admin.svg" class="rounded mx-auto d-block" alt="">   -->
      <router-view />
    </div>
  </div>
</template>

<script>
import Menuuser from "../components/Menuuser";
import InputSearch from "../components/InputSearch.vue";
export default {
  name: "Home",
  data(){
    return{
      isActive: false,
      category: [],
    }
  },
  computed:{
    user(){
      return this.$store.state.name;
    }
  },
  methods:{
    activeMenu: function () {
      this.isActive = !this.isActive;
    },
     logOut: function () {
      localStorage.removeItem("token");
      this.$store.state.name = '';
    },
  },
  mounted() {
    const config = {
      headers: {
        Authorization: "Bearer " + localStorage.getItem("token"),
      },
    };
    this.axios
      .get("http://127.0.0.1:8000/api/profile", config)
      .then((response) => {
        if(response.data.user != null)
        {
          this.$store.state.name = response.data.user.name;   
        }
      });

     this.axios
        .get("http://127.0.0.1:8000/api/category")
        .then((response) => {    
          this.category = response.data;
        })
        .catch((error) => {
          console.clear(error.response.data);
        });
  },
  components: {
   Menuuser,
   InputSearch
  },
};
</script>

<style scoped>
body {
  background-color: black;
}
.vertical-nav {
  min-width: 17rem;
  width: 17rem;
  height: 100vh;
  position: fixed;
  top: 0;
  left: 0;
  box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.1);
  transition: all 0.4s;
}

.page-content {
  width: calc(100% - 17rem);
  margin-left: 17rem;
  transition: all 0.4s;
}

/* for toggle behavior */

#sidebar.active {
  margin-left: -17rem;
}

#content.active {
  width: 100%;
  margin: 0;
}

@media (max-width: 768px) {
  #sidebar {
    margin-left: -17rem;
  }
  #sidebar.active {
    margin-left: 0;
  }
  #content {
    width: 100%;
    margin: 0;
  }
  #content.active {
    margin-left: 17rem;
    width: calc(100% - 17rem);
  }
}

body {
  background: #599fd9;
  background: -webkit-linear-gradient(to right, #599fd9, #c2e59c);
  background: linear-gradient(to right, #599fd9, #c2e59c);
  min-height: 100vh;
  overflow-x: hidden;
}
</style>
