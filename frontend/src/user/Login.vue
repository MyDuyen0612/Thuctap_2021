<template>
  <b-container class="login">
    <b-alert :show="message!=''" variant="danger">{{message}}</b-alert>
      <b-form @submit="onSubmit" @reset="onReset" v-if="show">
        <b-form-group
          id="input-group-1"
          label="Email address:"
          label-for="input-1"
        >
          <b-form-input
            id="input-1"
            v-model="form.email"
            type="email"
            :state="/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(form.email)? true: false" 
            placeholder="Enter email"
            required
          ></b-form-input>
        </b-form-group>

        <b-form-group id="input-group-3" label="Password:" label-for="input-3">
          <b-form-input
            id="input-3"
            v-model="form.password"
            :state="form.password.length >= 6"
            type="password"
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
        <div class="d-flex justify-content-between">
          <div>
            <b-button type="submit" variant="primary">Submit
               <div class="spinner-border text-success" role="status" v-show="isActive">
                  <span class="sr-only">Loading...</span>
                </div>
            </b-button>&nbsp;
            <b-button type="reset" variant="danger">Reset</b-button>
          </div>
          <div>
            <router-link to="register">
               <b-button type="reset" variant="primary">Đăng ký</b-button>
            </router-link>
          </div>
        </div>
      </b-form>
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
      message:'',
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
          this.$store.state.name=response.data.user.name;
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
<style scoped>
.login{
  margin-top: 5%;
}
</style>
