package jp.ac.tokyo_ct.hakonetozanrailway_android;

import android.content.Intent;
import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;


public class ActivityChangeSample extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_change_sample);

        Button button = (Button)findViewById(R.id.button);

        button.setOnClickListener(new View.OnClickListener(){

            @Override
            public void onClick(View v){

                Intent intent = new Intent();
                intent.setClassName("jp.ac.tokyo_ct.hakonetozanrailway_android","jp.ac.tokyo_ct.hakonetozanrailway_android.MainActivity");

                startActivity(intent);

            }

        });
    }
}
