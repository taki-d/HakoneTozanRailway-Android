package jp.ac.tokyo_ct.hakonetozanrailway_android;

import android.content.Intent;
import android.os.Bundle;
import android.app.Activity;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import com.google.android.gms.appindexing.AppIndex;
import com.google.android.gms.common.api.GoogleApiClient;

public class MainActivity extends Activity {

    /**
     * ATTENTION: This was auto-generated to implement the App Indexing API.
     * See https://g.co/AppIndexing/AndroidStudio for more information.
     */
    private GoogleApiClient client;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        // ATTENTION: This was auto-generated to implement the App Indexing API.
        // See https://g.co/AppIndexing/AndroidStudio for more information.
        client = new GoogleApiClient.Builder(this).addApi(AppIndex.API).build();

        Button button = (Button)findViewById(R.id.button1);

        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Button button = (Button) v;
                button.animate();
                Toast.makeText(MainActivity.this,"Button Clicked",Toast.LENGTH_SHORT).show();

                Intent intent = new Intent();
                intent.setClassName("jp.ac.tokyo_ct.hakonetozanrailway_android","jp.ac.tokyo_ct.hakonetozanrailway_android.ActivityChangeSample");

                startActivity(intent);
            }
        });
    }
}
