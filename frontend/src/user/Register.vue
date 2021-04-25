<template>
  <b-container class="register"> 
    <b-form @submit="onSubmit" @reset="onReset" v-if="show">
      <b-form-group
        id="input-group-1"
        label="Email address:"
        label-for="input-1"
      >
        <b-form-input
          id="input-1"
          v-model="form.email"
          :state="/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(form.email)? true: false"  
          type="email"
          placeholder="Enter email"
          required
        ></b-form-input>
      </b-form-group>
      <b-form-group id="input-group-2" label="Your Name:" label-for="input-2">
        <b-form-input
          id="input-2"
          type="text"
          v-model="form.name"
          :state="form.name.length >= 5"
          placeholder="Enter name"
          required
        ></b-form-input>
      </b-form-group>

      <b-form-group id="input-group-3" label="Password:" label-for="input-3">
        <b-form-input
          id="input-3"
          v-model.trim="$v.form.password.$model"
          :state="form.password.length >= 6"
          type="password"
          required
        ></b-form-input>
      </b-form-group>

      <div class="error" v-if="!$v.form.password.minLength">Password phai it nhat {{ $v.form.password.$params.minLength.min }} ky tu.</div>
      
      <b-form-group id="input-group-4" label="Repeat password:" label-for="input-4">
        <b-form-input
          id="input-4"
          v-model.trim="$v.form.repeatPassword.$model"
          :state="form.repeatPassword === form.password"
          type="password"
          required
        ></b-form-input>
      </b-form-group>

      <div class="error" v-if="!$v.form.repeatPassword.sameAsPassword">Passwords phai trung nhau.</div>

      <b-form-group id="input-group-5" v-slot="{ ariaDescribedby }">
        <b-form-checkbox-group
          v-model="form.checked"
          id="checkboxes-5"
          :aria-describedby="ariaDescribedby"
        >
          <b-form-checkbox value="me">Remenber me</b-form-checkbox>
        </b-form-checkbox-group>
      </b-form-group>

      <b-button type="submit" variant="primary">Submit
        <div class="spinner-border text-success" role="status" v-show="isActive">
          <span class="sr-only">Loading...</span>
        </div>
      </b-button>&nbsp;
      <b-button type="reset" variant="danger">Reset</b-button>
    </b-form>
  </b-container>
</template>

<script>
import {sameAs, minLength } from 'vuelidate/lib/validators'
  export default {
    name: 'Register',
    data() {
      return {
        form: {
          email: '',
          name: '',
          password: '',
          repeatPassword: '',
        },
        show: true,
        isActive: false,
      }
    },
    validations: {
      form:{
        password: {minLength: minLength(6)},
        repeatPassword: {sameAsPassword: sameAs('password')},
      }
    },
    methods: {
      onSubmit(event) {
        event.preventDefault();
        this.isActive = !this.isActive;
        const form = new FormData;
        form.append("email",this.form.email);
        form.append("password", this.form.password);
        form.append("name",this.form.name);
        this.axios.post("http://127.0.0.1:8000/api/register",form).then((response)=>{
          this.isActive = !this.isActive;
          alert(response.data.message);
          this.$router.push("login");
        }).catch((error)=>{
          alert(error.message);
        })
      },
      onReset(event) {
        event.preventDefault()
        // Reset our form values
        this.form.email = ''
        this.form.name = ''
        this.form.password = ''
        this.form.repeatPassword = ''
        
        // Trick to reset/clear native browser form validation state
        this.show = false
        this.$nextTick(() => {
          this.show = true
        })
      }
    }
  }
</script>
<style lang="scss" scope>
.register{
  margin-top: 5%;
  .error{
    font-size: 12px;
    color: red;
  }
}
</style>
