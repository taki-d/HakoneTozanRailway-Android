package jp.ac.tokyo_ct.hakonetozanrailway_android;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.app.Activity;

public class SplashActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        //requestWindowFeature(Window.FEATURE_NO_TITLE);

        Handler handler = new Handler();

        setContentView(R.layout.activity_splash);

        //3000ms　ロゴを表示する
        handler.postDelayed(new splashHandler(), 3000);

    }

    class splashHandler implements Runnable {
        public void run() {

            //MainActivityへレッツゴー
            Intent intent = new Intent(getApplication(),MainActivity.class);
            startActivity(intent);

            SplashActivity.this.finish();
        }
    }

}


