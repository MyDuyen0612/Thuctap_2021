<template>
  <b-container class="login">
     <img class="wave" src="../assets/img/wave.png">
    <b-alert :show="message != ''" variant="danger">{{ message }}</b-alert>
    <b-row align-h="center" class="mt-5">
      <b-col cols="5" class="img">
        <img src="../assets/img/login.svg"/>
      </b-col>
      <b-col cols="7" class="form">
        <b-form @submit="onSubmit" @reset="onReset" v-if="show">
          <b-form-group>
            <b-form-input
              id="input-1"
              v-model="form.email"
              type="email"
              :state="
                /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(form.email)
                  ? true
                  : false
              "
              placeholder="Enter email"
              required
            ></b-form-input>
          </b-form-group>

          <b-form-group>
            <b-form-input
              id="input-3"
              v-model="form.password"
              :state="form.password.length >= 6"
              type="password"
              placeholder="Password"
              required
            ></b-form-input>
          </b-form-group>

          <b-form-group id="input-group-4" v-slot="{ ariaDescribedby }">
            <b-form-checkbox-group
              v-model="form.checked"
              id="checkboxes-4"
              :aria-describedby="ariaDescribedby"
            >
              <b-form-checkbox value="remember">Remenber me</b-form-checkbox>
            </b-form-checkbox-group>
          </b-form-group>
          <div class="d-flex justify-content-around">
            <div>
              <b-button type="submit" variant="primary" class="btn"
                >Đăng nhập
                <div
                  class="spinner-border text-success"
                  role="status"
                  v-show="isActive"
                >
                  <span class="sr-only">Loading...</span>
                </div>
              </b-button>
            </div>
            <div>
               <router-link to="register" style="text-decoration:none">
                <b-button class="btn" type="reset" variant="primary">Đăng ký</b-button>
              </router-link>
            </div>
             
          </div>
        </b-form>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
export default {
  data() {
    return {
      form: {
        email: "",
        password: "",
      },
      message: "",
      isActive: false,
      show: true,
    };
  },
  methods: {
    onSubmit(event) {
      event.preventDefault();
      this.isActive = !this.isActive;
      const form = new FormData();
      form.append("email", this.form.email);
      form.append("password", this.form.password);
      this.axios
        .post("http://127.0.0.1:8000/api/login", form)
        .then((response) => {
          this.isActive = !this.isActive;
          localStorage.token = response.data.token;
          this.$store.state.name = response.data.user.name;
          this.$router.push("/");
        })
        .catch((error) => {
          this.isActive = !this.isActive;
          this.message = error.response.data.message;
          console.clear();
        });
    },
    onReset(event) {
      event.preventDefault();
      // Reset our form values
      this.form.email = "";
      this.form.password = "";

      // Trick to reset/clear native browser form validation state
      this.show = false;
      this.$nextTick(() => {
        this.show = true;
      });
    },
  },
};
</script>
<style lang="scss" scoped>
.login {
  margin-top: 5%;
  width: 80%;
  .wave{
    position: fixed;
    bottom: 0;
    left: 0;
    height: 100%;
    z-index: -1;
  }
 .img{
	display: flex;
	justify-content: flex-end;
  align-items: center;
  img{
    width: 500px;
    }
  }
  .form{
    position: relative;
    margin-top: 100px;
    .form-group {
    input {
      font-size: 18px;
      padding: 10px 10px 10px 10px;
      display: block;
      width: 100%;
      border: none;
      border-bottom: 2px solid rgba(0, 0, 0, 0.3);
      background: none;
      }
    }
  }
  .btn{
  display: block;
	width: 100%;
	height: 45px;
	border-radius: 25px;
	outline: none;
	border: none;
	background-image: linear-gradient(to right, #32be8f, #38d39f, #32be8f);
	background-size: 200%;
	color: #fff;
	font-family: 'Poppins', sans-serif;
	text-transform: uppercase;
	margin: 0.5rem 0;
	cursor: pointer;
	transition: .5s;
  }
}
</style>
