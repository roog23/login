import android.content.Intent
import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.android.volley.Request
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley
import com.example.jsp.ip.LOGIN_URL
import kotlinx.android.synthetic.main.activity_main.*

class Mainkt : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.maiakt)
        val queue = Volley.newRequestQueue(this)

        loginBtn.setOnClickListener {
            val inputLogin = userId.text.toString()
            val inputPassword = userPwd.text.toString()
            val url = "$LOGIN_URL?userId=$inputLogin&userPassword=$inputPassword"
            val stringRequest = StringRequest(Request.Method.GET, url,
                    { response ->
                        response.trim { it <= ' ' }
                        val details = response.split(",").toTypedArray()
                        if (response == "error") {
                            Toast.makeText(this@Mainkt, "Invalid email or password", Toast.LENGTH_SHORT).show()
                        } else {

                            Toast.makeText(this@Mainkt, "Login successful", Toast.LENGTH_SHORT).show()
                            SharedPrefManager.getInstance(this@Mainkt).resgiterCurrentUser(details[0], details[1])
                            startActivity(Intent(this@Mainkt, HomeActivity::class.java))
                            finish()
                        }
                    },
                    { })
            queue.add(stringRequest)
        }
    }


}
