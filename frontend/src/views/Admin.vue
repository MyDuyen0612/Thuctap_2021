<template>
  <div class="admin">
    <div
      class="vertical-nav bg-white"
      id="sidebar"
      :class="isActive == true ? 'active' : ''"
    >
     <div class="py-4 px-3 mb-4 bg-light">
      <div class="media d-flex align-items-center">
        <!-- <img
          src="../assets/img/admin.jpg"
          alt="..."
          width="65"
          class="mr-3 rounded-circle img-thumbnail shadow-sm"
        /> -->
        <div class="media-body">
          <h4 class="m-0">Mỹ Duyên</h4>
          <p class="font-weight-light text-muted mb-0">Administrator</p>
        </div>
      </div>
    </div>

    <p class="text-gray font-weight-bold text-uppercase px-3 small pb-4 mb-0">
      Shop Shinn_1999
    </p>

    <ul class="nav flex-column bg-white mb-0">
      <li class="nav-item">
        <router-link
          to="/admin/category"
          class="nav-link text-dark font-italic bg-light"
        >
         
          Danh mục
        </router-link>
      </li>
      <li class="nav-item">
        <router-link
          to="/admin/sanpham"
          class="nav-link text-dark font-italic bg-light"
        >
         
          Sản phẩm
        </router-link>
      </li>
      <li class="nav-item">
        <router-link
          to="/admin/user"
          class="nav-link text-dark font-italic bg-light"
        >
         
          User
        </router-link>
      </li>
    </ul>
    </div>

    <div
      class="page-content p-5"
      id="content"
      :class="isActive == true ? 'active' : ''"
    >
      <nav class="nav">
        <button
          id="sidebarCollapse"
          type="button"
          class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4"
          @click="activeMenu"
        >
          <i class="fa fa-bars mr-8"></i>
        </button>
        <Inputsearch />
      </nav>
      <!-- <img src="../assets/img/home_admin.svg" class="rounded mx-auto d-block" alt="">   -->
      <router-view />
    </div>
  </div>
</template>

<script>
import Inputsearch from "../components/InputSearch.vue";
export default {
  name: "Admin",
  data() {
    return {
      isActive: false,
    };
  },
  components: {
    Inputsearch,
  },
  methods: {
    activeMenu: function () {
      this.isActive = !this.isActive;
    },
  },
};
</script>

<style  scoped>
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

/*
*
* ==========================================
* FOR DEMO PURPOSE
* ==========================================
*
*/

body {
  background: #599fd9;
  background: -webkit-linear-gradient(to right, #599fd9, #c2e59c);
  background: linear-gradient(to right, #599fd9, #c2e59c);
  min-height: 100vh;
  overflow-x: hidden;
}
</style>>