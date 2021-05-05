public class service extends AppCompatActivity{
    private TextView etname;
    private TextView ettext;
    private Button eturllink;
    private ImageView view;
    private String eturl;
    Bitmap bitmap;
    String guidename =SharedPrefManager.getguide();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_viewservice);
        etname = findViewById(R.id.name);
        ettext = findViewById(R.id.service);
        eturllink = findViewById(R.id.urllink);
        view = findViewById(R.id.img);
        service();
        Thread uThread = new Thread() {
            @Override
            public void run(){
                try{
                    URL url = new URL("ip/img/"+guidename+".png");
                    HttpURLConnection conn = (HttpURLConnection)url.openConnection();
                    conn.setDoInput(true); //Server 통신에서 입력 가능한 상태로 만듦
                    conn.connect(); //연결된 곳에 접속할 때 (connect() 호출해야 실제 통신 가능함)
                    InputStream is = conn.getInputStream(); //inputStream 값 가져오기
                    bitmap = BitmapFactory.decodeStream(is); // Bitmap으로 반환
                }catch (MalformedURLException e){
                    e.printStackTrace();
                }catch (IOException e){
                    e.printStackTrace();
                }
            }
        };
        uThread.start(); // 작업 Thread 실행
        try{
            uThread.join();
            view.setImageBitmap(bitmap);
        }catch (InterruptedException e){
            System.out.println("no~~");
            e.printStackTrace();
        }
        eturllink.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v){
              Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(eturl));
              startActivity(intent);
            }
        });
    }

    private void service() {
        String url = Service_URL(ip부분) + "?guidename="+ guidename;
        System.out.println(url);
        StringRequest stringRequest = new StringRequest(Request.Method.GET, url,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        response = response.trim();
                        String details[] = response.split("~");
                        if (response.equals("error")) {
                        } else {
                            etname.setText(details[0]);
                            ettext.setText(details[1]);
                            eturl=details[2];
                        }
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                    }
                });
        RequestQueue requestQueue = Volley.newRequestQueue(service.this);
        requestQueue.add(stringRequest);
    }
}
