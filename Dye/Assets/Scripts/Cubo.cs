using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Cubo : MonoBehaviour {
    public GameObject projectile;
    void Start () {
        Instantiate (projectile);
    }

    void Update () {
        if (Timer (0.5f)) {
            //Instantiate (projectile);
        }
    }

    private float tempo;
    private bool Timer (float Intervalo) {

        if (tempo < Time.time) {
            tempo = Time.time + Intervalo;
            return true;
        } else return false;

    }
}