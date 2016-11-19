package jp.ac.tokyo_ct.hakonetozanrailway_android;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class ActivityChangeSample extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_change_sample);

        Button button = (Button)findViewById(R.id.button);

        button.setOnClickListener(new View.OnClickListener(){

            @Override
            public void onClick(View v){

                Intent intet = new Intent();
                intet.setClassName("jp.ac.tokyo_ct.hakonetozanrailway_android","jp.ac.tokyo_ct.hakonetozanrailway_android.MainActivity");

                startActivity(intet);

            }

        });
    }
}
